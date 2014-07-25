//
//  ViewController.h
//  Sai_Quiz_Application
//
//  Created by User1 on 2013-10-18.
//  Copyright (c) 2013 User1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
	IBOutlet	UILabel		*theQuestion;
	IBOutlet	UILabel		*theScore;
	IBOutlet	UILabel		*theLives;
	IBOutlet	UIButton	*answerOne;
	IBOutlet	UIButton	*answerTwo;
	IBOutlet	UIButton	*answerThree;
	IBOutlet	UIButton	*answerFour;
	NSInteger myScore;
	NSInteger myLives;
	NSInteger questionNumber;
	NSInteger rightAnswer;
	NSArray *theQuiz;
    NSArray *theAns;
	BOOL questionLive;
	BOOL restartGame;
}

@property (retain, nonatomic) UILabel	*theQuestion;
@property (retain, nonatomic) UILabel	*theScore;
@property (retain, nonatomic) UILabel	*theLives;
@property (retain, nonatomic) UIButton	*answerOne;
@property (retain, nonatomic) UIButton	*answerTwo;
@property (retain, nonatomic) UIButton	*answerThree;
@property (retain, nonatomic) UIButton	*answerFour;
@property (retain, nonatomic) NSArray *theQuiz;
@property (retain, nonatomic) NSArray *theAns;

-(IBAction)buttonOne;
-(IBAction)buttonTwo;
-(IBAction)buttonThree;
-(IBAction)buttonFour;
- (IBAction)restart;



-(void)checkAnswer;

-(void)askQuestion;

-(void)updateScore;

-(void)loadQuiz;

-(void)countDown;


@end
