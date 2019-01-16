package com.company.smartwater.utils;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.codehaus.jackson.type.TypeReference;

import java.io.IOException;

public class JsonUtil {
	public static String convertObject2Json(Object o){
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		try {
			String jsonStr = ow.writeValueAsString(o);
			return jsonStr.replaceAll("\\r\\n", "");
		} catch (Exception e) {
		}
		
		return null;
	}
	
	public static <T> T convertJson2Object(String json, Class<T> clasz){
		T ob = null;
		try {
			ob = new ObjectMapper().readValue(json, clasz);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ob;
	}
	
	public static <T> T convertJson2Object(String json, TypeReference<T> type){
		T ob = null;
		try {
			ob = new ObjectMapper().readValue(json, type);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ob;
	}
}
