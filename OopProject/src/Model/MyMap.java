package Model;

import java.util.ArrayList;

public class MyMap<K, V> {
	private ArrayList<K> keys = new ArrayList<K>();
	private ArrayList<V> values = new ArrayList<V>();
	private int currentIndex;
	public MyMap() {
		currentIndex = 0;
	}
	public void put(K key, V value) {
		int index = currentIndex;
		if(keys.contains(key)){
			index = keys.indexOf(key);
			keys.remove(index);
			values.remove(index);
		}
		keys.add(index, key);
		values.add(index, value);
		currentIndex++;
	}
	
	public V get(K key){
		int index = keys.indexOf(key);
		return values.get(index);
	}
	
	public boolean containsKey(K key){
		return keys.contains(key);
	}
	
	public ArrayList<K> keySet(){
		return keys;
	}
	
}
