package com.code5.fw.db;

import java.sql.Connection;
import java.sql.SQLException;

import org.sqlite.SQLiteConfig;

/**
 * @author zero
 *
 */
public class Transaction_SQLITE_JDBC_CODE5_DEV extends Transaction {

	/**
	 *
	 */
	protected Connection createConnection() throws SQLException {

		String url = "jdbc:sqlite:C:/public/code5/doc/code5.db";

		SQLiteConfig config = new SQLiteConfig();
		Connection conn = org.sqlite.JDBC.createConnection(url, config.toProperties());

		return conn;

	}

}
