package com.library.model;

public class Book {
	private int id; // Auto-generated by DB
	private String title;
	private String author;
	private String genre;
	private String availability;

	// ✅ Constructor for adding a book (No ID needed)
	public Book(String title, String author, String genre, String availability) {
		this.title = title;
		this.author = author;
		this.genre = genre;
		this.availability = availability;
	}

	// ✅ Constructor for retrieving/updating books (ID included)
	public Book(int id, String title, String author, String genre, String availability) {
		this.id = id;
		this.title = title;
		this.author = author;
		this.genre = genre;
		this.availability = availability;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}
}
