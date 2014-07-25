package com.example.sai_quizapp;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class ResultsActivity extends MainActivity  {
	
	EditText txtResult;
	private QuizDriver quizDriver;
	
	
	

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_results);
		
		quizDriver = (QuizDriver) getApplication();
		
		txtResult = (EditText) findViewById(R.id.results);
		txtResult.setKeyListener(null);
		txtResult.setText(quizDriver.getResultsString() + "\n \n \n Thanks For Playing..");
		
		
		
		btnStartQuiz = (Button) findViewById(R.id.startQuiz);
		btnStartQuiz.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				openFile("all_questions.txt", v.getContext());

				Intent intent = new Intent(v.getContext(), MainActivity.class);
				startActivityForResult(intent, 0);
			}
		});
		
	}

	
	

	
	
	public boolean onCreateOptionsMenu(Menu menu) {
		
		getMenuInflater().inflate(R.menu.results, menu);
		return true;
	}
	



}
