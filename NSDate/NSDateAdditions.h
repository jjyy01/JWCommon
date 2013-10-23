/* 
 * Copyright (c) 2009 Keith Lazuka
 * License: http://www.opensource.org/licenses/mit-license.html
 */

#import <Foundation/Foundation.h>

@interface NSDate (KalAdditions)

// All of the following methods use [NSCalendar currentCalendar] to perform
// their calculations.
+ (void) setCalendar:(NSCalendar *)calendar;
+ (void) unload;

- (NSDate *)cc_dateByMovingToBeginningOfDay;
- (NSDate *)cc_dateByMovingToEndOfDay;
- (NSDate *)cc_dateByMovingToFirstDayOfTheWeek;
- (NSDate *)cc_dateByMovingToLastDayOfTheWeek;
- (NSDate *)cc_dateByMovingToFirstDayOfThePreviousWeek;
- (NSDate *)cc_dateByMovingToFirstDayOfTheFollowingWeek;
- (NSDate *)cc_dateByMovingToFirstDayOfTheMonth;
- (NSDate *)cc_dateByMovingToLastDayOfTheMonth;
- (NSDate *)cc_dateByMovingToFirstDayOfThePreviousMonth;
- (NSDate *)cc_dateByMovingToFirstDayOfTheFollowingMonth;
- (NSDate *)cc_dateByMovingToFirstDayOfTheQuarter;
- (NSDate *)cc_dateByMovingToLastDayOfTheQuarter;
- (NSDate *)cc_dateByMovingToFirstDayOfThePreviousQuarter;
- (NSDate *)cc_dateByMovingToFirstDayOfTheFollowingQuarter;
- (NSDate *)cc_dateByMovingToFirstDayOfTheYear;
- (NSDate *)cc_dateByMovingToLastDayOfTheYear;
- (NSDate *)cc_dateByMovingToFirstDayOfThePreviousYear;
- (NSDate *)cc_dateByMovingToFirstDayOfTheFollowingYear;
- (NSDateComponents *)cc_componentsForMonthDayAndYear;
- (NSUInteger)cc_weekday;
- (NSUInteger)cc_numberOfDaysInMonth;

@end