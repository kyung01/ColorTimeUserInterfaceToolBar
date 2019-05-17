//
//  CTMainMenu.h
//  ColorTimeUserInterfaceToolbar
//
//  Created by Kyung Chang on 5/15/19.
//  Copyright © 2019 Kyung Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTOnOffMenu.h"
#import "CTColorTimeMenu.h"
#import "CTSelectMenu.h"
#import "CTEditMenu.h"
#import "CTPresetMenu.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMainMenu : UIToolbar

@property  (weak) IBOutlet CTOnOffMenu* onAndOffMenu;
@property  (weak) IBOutlet CTEditMenu* editMenu;
@property  (weak) IBOutlet CTColorTimeMenu* colorTimeMenu;
@property  (weak) IBOutlet CTPresetMenu* presetMenu;
@property  (weak) IBOutlet CTSelectMenu* selectMenu;

@end

NS_ASSUME_NONNULL_END
