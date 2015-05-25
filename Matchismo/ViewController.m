//
//  ViewController.m
//  Matchismo
//
//  Created by Nelly Chakarova on 05/05/15.
//  Copyright (c) 2015 Nelly Chakarova. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UILabel *gamePlayDisplay;
@end


@implementation ViewController

-(void)viewDidLoad{
     [self.segment setSelectedSegmentIndex:0];
}

- (IBAction)matchModeChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.game.mode = 1;
            NSLog(@"1 %d",self.game.mode);
            break;
        case 1:
            self.game.mode = 2;
             NSLog(@"2 %d",self.game.mode);
            break;
        default:
            self.game.mode = 1;
    }
}

- (IBAction)restartGame:(id)sender {
    self.game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
     self.segment.enabled = YES;
    [self.segment setSelectedSegmentIndex:0];
    [self updateUI];
}

-(CardMatchingGame *)game{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}


-(Deck*)createDeck{
    return [[PlayingCardDeck alloc]init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    self.segment.enabled = NO;
    int chooseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
}

-(void) updateUI{
    for(UIButton *cardButton in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        self.gamePlayDisplay.text = [NSString stringWithFormat:@"%@",self.game.gameDisplay];
    }
}

-(NSString*) titleForCard:(Card*)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage*)backgroundImageForCard:(Card*) card{
    return [UIImage imageNamed:card.isChosen ? @"front" : @"back"];
}


@end
