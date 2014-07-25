//
//  ViewController.m
//  Sai_Quiz_Application
//
//  Created by User1 on 2013-10-18.
//  Copyright (c) 2013 User1. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

@synthesize theQuestion, theScore, theLives, answerOne, answerTwo, answerThree, answerFour, theQuiz,theAns;
static NSMutableArray *myArray; //[NSMutableArray arrayWithCapacity:10];

-(void)askQuestion
{
    
    // Unhide all the answer buttons.
    [answerOne setHidden:NO];
    [answerTwo setHidden:NO];
    [answerThree setHidden:NO];
    [answerFour setHidden:NO];
    
    // Set the game to a "live" question (for timer purposes)
    questionLive = YES;
    
    
    
    // Go to the next question
    questionNumber = questionNumber + 1;
    NSInteger row ;
    NSInteger arow;
    
    
    
    // We get the question from the questionNumber * the row that we look up in the array.
    
    // NSInteger r ;
    
    int r1;
    
    row = [self getRanNum:r1];
    arow=row*5;
    
    // Set the question string, and set the buttons the the answers
    NSString *selected = [theQuiz objectAtIndex:row];
    NSString *activeQuestion = [[NSString alloc] initWithFormat:@"Question: %@", selected];
    if([theQuiz count]==0)
    {
        [answerOne setTitle:[theAns objectAtIndex:row] forState:UIControlStateNormal];
        [answerTwo setTitle:[theAns objectAtIndex:row+1] forState:UIControlStateNormal];
        [answerThree setTitle:[theAns objectAtIndex:row+2] forState:UIControlStateNormal];
        [answerFour setTitle:[theAns objectAtIndex:row+3] forState:UIControlStateNormal];
        rightAnswer = [[theAns objectAtIndex:row+4] intValue];
    }
    
    else
    {
        [answerOne setTitle:[theAns objectAtIndex:arow] forState:UIControlStateNormal];
        [answerTwo setTitle:[theAns objectAtIndex:arow+1] forState:UIControlStateNormal];
        [answerThree setTitle:[theAns objectAtIndex:arow+2] forState:UIControlStateNormal];
        [answerFour setTitle:[theAns objectAtIndex:arow+3] forState:UIControlStateNormal];
        rightAnswer = [[theAns objectAtIndex:arow+4] intValue];
    }
    
    // Set theQuestion label to the active question
    theQuestion.text = activeQuestion;
    
    // Start the timer for the countdown
    
}





-(int)getRanNum:(int)r
{
    
    NSNumber *n1;
    
    NSInteger rendom = arc4random()%[theQuiz count]  ;
    
    n1=[NSNumber numberWithInt:rendom];
    
    
    
    [myArray addObject:n1];
    
    
    long int i,cnt=[myArray count]-1;
    
    
    //check for the unique random number generated
    for(i=0;i<cnt;i++)
    {
        
        if([myArray[cnt] isEqualToNumber: myArray[i]])
            rendom= [self getRanNum:r];
        
        
    }
    
    return rendom;
    
}
-(void)updateScore
{
	// If the score is being updated, the question is not live
	questionLive = NO;
	
	
	
	// Hide the answers from the previous question
	[answerOne setHidden:YES];
	[answerTwo setHidden:YES];
	[answerThree setHidden:YES];
	[answerFour setHidden:YES];
	NSString *scoreUpdate = [[NSString alloc] initWithFormat:@"Score: %d", myScore];
	theScore.text = scoreUpdate;
	
	
	// END THE GAME.
    //	NSInteger endOfQuiz = [theQuiz count];
    
	if((questionNumber-1)  == 4)
	{
		// Game is over.
		if(myScore >= 0)
		{
			NSString *finishingStatement = [[NSString alloc] initWithFormat:@"You score is : %ld/5",
                                            (long)myScore];
			theQuestion.text = finishingStatement;
            if(myScore<3)
            {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"Please try again!"
                                      message:finishingStatement
                                      delegate:nil
                                      cancelButtonTitle:@"Thank you."
                                      otherButtonTitles:nil];
                [alert show];
            }
            else if (myScore==3)
            {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"Good Job!"
                                      message:finishingStatement
                                      delegate:nil                                   cancelButtonTitle:@"Thank you."
                                      otherButtonTitles:nil];
                [alert show];
            }
            
            else if (myScore==4)
            {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"Excellent Work!"
                                      message:finishingStatement
                                      delegate:nil
                                      cancelButtonTitle:@"Thank you."
                                      otherButtonTitles:nil];
                [alert show];
            }
            
            else if (myScore==5)
            {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"You are Genious!"
                                      message:finishingStatement
                                      delegate:nil
                                      cancelButtonTitle:@"Thank you."
                                      otherButtonTitles:nil];
                [alert show];
                
            }
            
			
		}
		else
		{
			NSString *finishingStatement = [[NSString alloc] initWithFormat:@"Game Over!\n You're terrible! \nYou scored %i.", myScore];
			theQuestion.text = finishingStatement;
			
		}
		theLives.text = @"";
		
		// Make button 1 appear as a reset game button
		/*restartGame = YES;
         [answerOne setHidden:NO];
         [answerOne setTitle:@"Restart game!" forState:UIControlStateNormal];*/
    }
    else
    {
        [self askQuestion];
    }
    
    
}

- (IBAction)buttonOne
{
	if(questionNumber == 0){
		// This means that we are at the startup-state
		// We need to make the other buttons visible, and start the game.
		[answerTwo setHidden:NO];
		[answerThree setHidden:NO];
		[answerFour setHidden:NO];
		[self askQuestion];
	}
	else
	{
		NSInteger theAnswerValue = 1;
		[self checkAnswer:(int)theAnswerValue];
        // [self askQuestion];
		
	}
}

- (IBAction)buttonTwo
{
	NSInteger theAnswerValue = 2;
	[self checkAnswer:(int)theAnswerValue];
    //[self askQuestion];
}

- (IBAction)buttonThree
{
	NSInteger theAnswerValue = 3;
	[self checkAnswer:(int)theAnswerValue];
    //[self askQuestion];
}

- (IBAction)buttonFour
{
	NSInteger theAnswerValue = 4;
	[self checkAnswer:(int)theAnswerValue];
    //[self askQuestion];
}



// Check for the answer (this is not written right, but it runs)
-(void)checkAnswer:(int)theAnswerValue
{
	if(rightAnswer == theAnswerValue)
	{
		//theQuestion.text = @"Daaamn";
		myScore = myScore + 1;
	}
	
	[self updateScore];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	questionLive = NO;
	restartGame = NO;
	theQuestion.text = @"DO You want to play Quiz";
	theScore.text = @"Your Score:0";
	theLives.text = @"";
	questionNumber = 0;
	myScore = 0;
	myLives = 0;
	[answerOne setTitle:@"Start Quiz!" forState:UIControlStateNormal];
	[answerTwo setHidden:YES];
	[answerThree setHidden:YES];
	[answerFour setHidden:YES];
	[self loadQuiz];
    myArray=[NSMutableArray array];
}

-(void)loadQuiz
{
	// This is our forced-loaded array of quiz questions.
	// FORMAT IS IMPORTANT!!!!
	// 1: Question, 2 3 4 5: Answers 1-4 respectively, 6: The right answer
	// THIS IS A TERRIBLE WAY TO DO THIS. I will figure out how to do nested arrays to make this better.
	NSArray *quizArray = [[NSArray alloc] initWithObjects:@"What is the chemical symbol for hydrogen?",
						  @"What is an essential ingredient of a game of water polo?",
						  @"Where is the Lateran palace?",
						  @"Who was killed by their own sikh bodyguards in 1984?",
                          @"The National Sport of India is?",
                          @"What is the longest river flowing in India?",
                          @"When was Jana-gana-mana first sung?",
                          @"Natya - Shastra' the main source of India's classical dances was written by?",
                          @"The Vijayanagara ruler, Kirshnadev Raya's work Amuktamalyada, was in?",
                          @"Which of the following is used in pencils?", nil];
	self.theQuiz = quizArray;
	
    NSArray *quizAns=[[NSArray alloc] initWithObjects:@"Hy",@"He",@"K",@"H",@"4",@"A mallet",
                      @"A horse", @"Water", @"A pole",@"3",
                      @"Istanbul", @"Florence", @"Avignon", @"Rome", @"4",
                      @"Indira Ghandhi",@"Sanjeev Nanda", @"Rajiv Gandhi", @"Harmandir Singh",@"1",
                      @" Cricket",@"Hockey", @"Badminton", @"None of the above",@"2",
                      @"Alaknanda",@"Yumana",@" Ganga",@"Gumti",@"3",
                      @"1911", @"1947", @"1950", @" 1951", @"1",
                      @"Nara Muni", @"Bharat Muni", @"Abhinav Gupt", @"Tandu Muni", @"2",
                      @"Telugu", @"Sanskrit", @"Tamil", @"Kannada", @"1",
                      @"Graphite",@"Silicon", @"Charcoal", @"Phosphorous",  @"1",
                      nil];
    
    self.theAns = quizAns;
    
}

- (IBAction)restart {
    UIAlertView *restartAlert = [[UIAlertView alloc] initWithTitle:@"Are you sure?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes, restart", nil];
    [restartAlert show];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
