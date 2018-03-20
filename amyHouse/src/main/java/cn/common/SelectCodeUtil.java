package cn.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cn.entity.Parameter;

/*
 * @ Copyright (c) Create by JASON  Date:2018-03-11  All rights reserved.
 *
 * @ class description：使用单例模式，读取两个节点的xml文件，实例化唯一一个选择区域的对象Map
 *
 */
public class SelectCodeUtil {
	
	private static SelectCodeUtil selectCodeUtil;
	private Map<String,List<Parameter>> selectMap;
	private Document document;
	
	
	private SelectCodeUtil(String filePath,String key1,String key2){
		List<Parameter> listPosition = new ArrayList<Parameter>();
		List<Parameter> listDistrict = new ArrayList<Parameter>();
		selectMap = new HashMap<String, List<Parameter>>();
		
		try {
			//载入文件
			SAXReader saxReader = new SAXReader();
			document = saxReader.read(new File(filePath));
			//获取根节点
			Element root = document.getRootElement();
			Iterator<Element> eleBrands = root.elementIterator();
			//读取节点
			while(eleBrands.hasNext()){
				Element brand = (Element)eleBrands.next();
				String key = brand.attributeValue("name");
				if(key.equals(key1)){
					
					Iterator<Element> eleTypes = brand.elementIterator();
					while(eleTypes.hasNext()){
						Element type = (Element)eleTypes.next();
						Parameter parameter = new Parameter(type.attributeValue("key"), type.attributeValue("value"));
						listPosition.add(parameter);
					}
					//把取到的值放进Map
					selectMap.put(key, listPosition);
					
				}
				if(key.equals(key2)){
					
					Iterator<Element> eleTypes = brand.elementIterator();
					while(eleTypes.hasNext()){
						Element type = (Element)eleTypes.next();
						Parameter parameter = new Parameter(type.attributeValue("key"), type.attributeValue("value"));
						listDistrict.add(parameter);
					}
					//把取到的值放进Map
					selectMap.put(key, listDistrict);
					
				}
		
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		}
	}
	
	public static synchronized SelectCodeUtil getInstance(String filePath,String key1,String key2){
		if(null == selectCodeUtil){
			selectCodeUtil = new SelectCodeUtil(filePath,key1,key2);
		}
		return selectCodeUtil;
	}
	
	
	public Map<String, List<Parameter>> getSelectMap(){
		return  selectMap;
	}
	
//测试	
//	public static void main(String[] args) {
//		//xml文件绝对路径
//		String filePath = new File("src/main/resources/SelectCode.xml").getAbsolutePath();
//		String key1 = "position";//第一节点名
//		String key2 = "district";//第二节点名
//		Map<String, List<Parameter>> map = SelectCodeUtil.getInstance(filePath,key1,key2).getSelectMap();
//		System.out.println(map);
//		Set<String> keys = map.keySet();
//		for(String key : keys){
//			System.out.println("二级节点"+key);
//			List<Parameter> list = (List<Parameter>)map.get(key);
//			for(Parameter p:list){
//				System.out.println("\t"+p.getKey()+p.getValue());
//			}
//		}
//	}

}


