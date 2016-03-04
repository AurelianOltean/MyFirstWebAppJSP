package dao;

import java.util.*;
import domain.Produs;

public interface Dao {
	
	public List<Produs> getAllProducts();
	public boolean adaugaProdus(Produs produs);

}
