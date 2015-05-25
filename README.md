Assignment 1

Required Tasks
1. Follow the detailed instructions in the lecture slides (separate document) to build and run Matchismo in the iPhone Simulator in Xcode 5. Do not proceed to the next steps unless your card flips back and forth as expected and builds without warnings or errors.
2. Be sure to include all the code for the four classes shown in the first two lectures: Card, Deck, PlayingCard and PlayingCardDeck. You must type this code in (e.g., do not copy and paste it from somewhere). The whole point of this Required Task is to gain experience editing code in Xcode and to get used to Objective-C syntax.
3. Add a private property of type Deck * to the CardGameViewController.
4. Use lazy instantiation to allocate and initialize this property (in the property’s getter)
so that it starts off with a full deck of PlayingCards.
5. Matchismo so far only displays the A♣ over and over. Fix Matchismo so that each time the card is flipped face up, it displays a different random card drawn from the
Deck property you’ve created above. In other words, Matchismo should flip through an entire deck of playing cards in random order, showing each card one at a time.
6. Do not break the existing functionality in Matchismo (e.g. the Flips counter should still continue to count flips).

Assignment 2

Required Tasks
1. Follow the detailed instructions in the lecture slides (separate document) to reproduce the latest version of Matchismo we built in lecture (i.e. the one with multiple cards) and run it in the iPhone Simulator. Do not proceed to the next steps unless your card matching game functions as expected and builds without warnings or errors.
2. Add a button which will re-deal all of the cards (i.e. start a new game). It should reset the score (and anything else in the UI that makes sense). In a real game, we’d probably want to ask the user if he or she is “sure” before aborting the game in process to re-deal, but for this assignment, you can assume the user always knows what he or she is doing when they hit this button.
3. Drag out a switch (UISwitch) or a segmented control (UISegmentedControl) into your View somewhere which controls whether the game matches two cards at a time or three cards at a time (i.e. it sets “2-card-match mode” vs. “3-card-match mode”). Give the user appropriate points depending on how difficult the match is to accomplish. In 3-card-match mode, it should be possible to get some (although a significantly lesser amount of) points for picking 3 cards of which only 2 match in some way. In that case, all 3 cards should be taken out of the game (even though only 2 match). In 3-card-match mode, choosing only 2 cards is never a match.
4. Disable the game play mode control (i.e. the UISwitch or UISegmentedControl from Required Task 3) when a game starts (i.e. when the first flip of a game happens) and re-enable it when a re-deal happens (i.e. the Deal button is pressed).
5. Add a text label somewhere which desribes the results of the last consideration by the CardMatchingGame of a card choice by the user. Examples: “Matched J♥ J♠ for 4 points.” or “6♦ J♣ don’t match! 2 point penalty!” or “8♦” if only one card is chosen or even blank if no cards are chosen. Do not violate MVC by building UI in your Model. “UI” is anything you are going to present to the user. This must work properly in either mode of Required Task 3.
6. Change the UI of your game to have 30 cards instead of 12. See Hints about the size of cards.
7. Do not change the method signature of any public method we went over in lecture. It is fine to change private method signatures (though you should not need to) or to add public and/or private methods.
