package com.booking;

import java.sql.Connection;

public class BookingDAO {

	private Connection conn;
	
	// DI (의존성주입)
	public BookingDAO(Connection conn) {
		this.conn = conn;
		
	}
	
	
	
	
	
}
