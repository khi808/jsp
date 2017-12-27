package util;

import java.util.HashMap;
import java.util.Map;

public class Thermometer {
	private Map<String, Double> locationCelsiusMap
		= new HashMap<>();
	
	public void setCelsius(String location, Double value) {
		locationCelsiusMap.put(location, value);
	}
	// map에서 로케이션 정보를 받아 온도을 리턴
	public Double getCelsius(String location) {
		return locationCelsiusMap.get(location);
	}
	// 특정 지역의 섭씨 -> 화씨로 변환
	public Double getFahrenhiet(String location) { /* 서울, 32 */
		Double celsius = locationCelsiusMap.get(location);
		if(celsius == null)
			return null;
		return celsius.doubleValue() * 1.8 + 32.0; /* 섭씨 -> 화씨 */ // 89.6 서울날씨 32도기준
	}
	public String getInfo() {
		return "온도기 변환기 1.1";
	}
}
