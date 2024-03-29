package dao;

import java.sql.*;
import com.mysql.jdbc.Driver;
import java.util.*;
import domain.Produs;

public class DaoImpl implements Dao {
	
	private Connection connection = null;
	private PreparedStatement prepStatement = null;
	private ResultSet resultSet = null; // e live :) two way bind
	
	private void creazaConexiuneaLaDB() {
		
		try {
			Class driver = Class.forName("com.mysql.jdbc.Driver");
			System.out.println("a rulat (?)");
			
			connection = DriverManager.
					getConnection("jdbc:mysql://localhost/jademy5_02vanzari"
								  , "root", "1234");
			System.out.println(connection.getClass());

			
		} catch (ClassNotFoundException e) {
			System.out.println("Nu s-a gasit clasa Driver");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Nu s-a creat conexiunea la baza de date");
			e.printStackTrace();
		}
		
	}
	
	private void inchideResursele() {
		
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				System.out.println("Am incercat sa inchid conexiunea dar nu am reusit");
				e.printStackTrace();
			}
		}
		
		
		if (prepStatement != null) {
			try {
				prepStatement.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<Produs> getAllProducts() {
		
		creazaConexiuneaLaDB();
		
		String query = "select * from prod;";
		
		try {
			prepStatement = connection.prepareStatement(query);
			resultSet = prepStatement.executeQuery(query);
			List<Produs> produse = new ArrayList<Produs>(); 
			
			while (resultSet.next()) {
				
				Produs produs = new Produs(resultSet.getString("codp"),
										   resultSet.getString("den"),
										   resultSet.getString("culoare"),
										   resultSet.getString("stoc"),
										   resultSet.getString("pret"));
				produse.add(produs);
			}
			
			return produse;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
			
		} catch (NullPointerException npe) {
			
			System.out.println("Nu s-a creat conexiunea la baza de date");
			npe.printStackTrace();
			return null;
			
		} finally {
			
			inchideResursele();
			
		}
	}

	@Override
	public boolean adaugaProdus(Produs produs) {
		creazaConexiuneaLaDB();
		try {
			
			String query = "insert into prod values(?, ?, ?, ?, ?);";
			prepStatement = connection.prepareStatement(query);
			
			prepStatement.setInt(1, new Integer(produs.getId().trim()));
			prepStatement.setString(2, produs.getName().trim());
			prepStatement.setString(3, produs.getColor().trim());
			prepStatement.setInt(4, new Integer(produs.getPrice().trim()));
			prepStatement.setInt(5, new Integer(produs.getStoc().trim()));
			
			prepStatement.executeUpdate();

			inchideResursele();
			
		} catch (SQLException e) {
			System.out.println("Nu s-a putut crea obiectul statement"
					+ " sau nu s-a executat query-ul.");
			e.printStackTrace();
			return false;
		} catch (NullPointerException npe) {
			System.out.println("Nu s-a creat conexiunea la baza de date in adaugaProdus");
			npe.printStackTrace();
			return false;
		} finally {
			inchideResursele();
		}
		
		return true;
	}
	
	

}
