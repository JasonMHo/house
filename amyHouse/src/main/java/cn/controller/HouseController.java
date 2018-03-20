package cn.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.common.Pages;
import cn.entity.TDistrict;
import cn.entity.THouse;
import cn.entity.TPic;
import cn.entity.TStreet;
import cn.entity.TUser;
import cn.query.HouseQuery;
import cn.service.DistrictService;
import cn.service.HouseService;
import cn.service.PicService;

@Controller
@RequestMapping("/house")
public class HouseController {

	@Resource()
	@Qualifier("districtService") // @Resource() @Qualifier("")这两个注解相当于构造方法中把实例赋值给该属性
	private DistrictService districtService;

	@Resource
	@Qualifier("houseService")
	private HouseService houseService;

	@Resource
	@Qualifier("picService")
	private PicService picService;

	// 查询信息
	@RequestMapping(value = "/list")
	public String list(Model model, HouseQuery houseQuery, HttpServletRequest request) {

		// 调用service方法查询集合
		Pages<THouse> pages = houseService.getHousePages(houseQuery);
		// 将查询结果存储到model
		model.addAttribute("pages", pages);

		// 查询区的集合
		List<TDistrict> districts = districtService.queryAllDistrict();
		// 将查询区的集合结果存储起来
		request.getSession().setAttribute("districts", districts);

		// 根据区ID查询街道集合
		List<TStreet> streets = null;
		if (null != houseQuery.getDistrictId()) {
			streets = districtService.getStreetsByDistrictId(houseQuery.getDistrictId());
		}
		// 将街道存储
		request.getSession().setAttribute("streets", streets);

		// 存储查询条件进行回显
		model.addAttribute("houseQuery", houseQuery);
		

		// 页面跳转 - 返回逻辑视图名
		return "houseList";
	}
	
	
	// 保存
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String save(Model model) {
		
		
		return "houseAdd";
	}
	
	

	// 保存
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String save(@RequestParam MultipartFile img, Model model, THouse house, HttpServletRequest request)
			throws IOException {

		// 上传的图片
		TPic pic = new TPic();
		if (img.getSize() != 0) {
			// 获取图片上传的真实路径
			String realPath = request.getSession().getServletContext().getRealPath("/resource/upload");

			String imgFileName = img.getOriginalFilename();
			String suffix = imgFileName.substring(imgFileName.indexOf("."));// 后缀名
			String noRepeatName = UUID.randomUUID().toString() + suffix;// 通过UUID加后缀名，组成不会重复的文件名

			// 根据保存的图片路径构造File文件对象
			String srcPath = realPath + "/" + noRepeatName;
			File file = new File(srcPath);
			// 保存到数据库时的路径
			String saveToDBpath = "/resource/upload" + "/" + noRepeatName;
			// 写入文件
			img.transferTo(file);

			// 图片描述信息
			String imgDesc = request.getParameter("imgDesc");
			if (null != imgDesc && !"".equals(imgDesc)) {
				pic.setTitle(imgDesc);
			}
			// 图片保存的路径
			pic.setUrl(saveToDBpath);
		}

		// 页面上传进来的对象house, 后台再添加一些属性
		house.setAdddate(new Date());

		TUser user = (TUser) request.getSession().getAttribute("user");
		house.setUserid(user.getId());

		String msg = "";
		if (houseService.findHouse(house)) {
			msg = "此房子已存在";

		} else {
			// 把 house 添加到数据库
			int i = houseService.addHouse(house);
			if(i > 0){
				msg = "添加房子成功";
			}else{
				msg = "添加房子失败";
			}

			if (img.getSize() != 0) {
				pic.setHouseid(house.getId());
				// 把 pic 添加到数据库，pic依赖于house，pic对象有两个字段，一个是url，一个是 houseid
				// houseid 是通过先把 house 加入到数据库后再获取到的
				picService.addPic(pic);
			}
		}
		model.addAttribute("msg", msg);
		//request.getSession().setAttribute("msg", msg);

		// 页面跳转 - 返回逻辑视图名
		return "forward:/house/list";
	}

	@RequestMapping(value = "/delete/{id}") // REST 风格
	public String delete(@PathVariable Long id,Model model,HttpServletRequest request) {
        String msg = "";
		int i = houseService.deleteHouse(id);
		if(i > 0){
			msg = "删除成功";
		}else{
			msg = "删除失败";
		}
		model.addAttribute("msg", msg);
		//request.getSession().setAttribute("msg", msg);

		return "forward:/house/list";
	}

	//修改页面
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.GET) // REST 风格
	public String modify(@PathVariable Long id, Model model, HttpServletRequest request) {

		THouse house = houseService.getHouseById(id);

		// 查询区的集合
		List<TDistrict> districts = districtService.queryAllDistrict();
		// 将查询区的集合结果存储起来
		request.getSession().setAttribute("districts", districts);

		// 根据区ID查询街道集合
		List<TStreet> streets = null;
		if (null != house.getDistrict().getId()) {
			streets = districtService.getStreetsByDistrictId(house.getDistrict().getId());
		}
		// 将街道存储
		request.getSession().setAttribute("streets", streets);

		model.addAttribute("house", house);
		return "houseModify";
	}
	
	//修改页面，提交修改后的house
	@RequestMapping(value = "/modify", method = RequestMethod.POST) // REST 风格
	public String modify(Model model, THouse house, HttpServletRequest request) {
		
		//把pubdate当修改日期
		house.setPubdate(new Date());
		int i = houseService.updateHouse(house);
		String msg = "";
		if(i > 0){
			msg = "修改成功";
		}else{
			msg = "修改失败";
		}
		model.addAttribute("msg", msg);
		//request.getSession().setAttribute("msg", msg);
		
		return "forward:/house/list";
	}

	/*
	 * @responseBody 注解的作用是将controller的方法返回的对象通过适当的转换器转换为指定的格式之后，
	 * 写入到response对象的body区，通常用来返回JSON数据或者是XML数据，
	 * 需要注意的呢，在使用此注解之后不会再走试图处理器，而是直接将数据写入到输入流中， 他的效果等同于通过response对象输出指定格式的数据。
	 */
	@ResponseBody
	@RequestMapping(value = "/getStreetByAjax")
	public List<TStreet> getStreetByAjax(Long districtId) {
		List<TStreet> streets = districtService.getStreetsByDistrictId(districtId);
		return streets;
	}

}
