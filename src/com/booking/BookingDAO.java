package com.booking;

import java.sql.Connection;

public class BookingDAO {

	private Connection conn;
	
	// DI (����������)
	public BookingDAO(Connection conn) {
		this.conn = conn;
		
	}
	
	
	
	
	
}
