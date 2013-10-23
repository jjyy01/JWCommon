/* 
 * Copyright (c) 2009 Keith Lazuka
 * License: http://www.opensource.org/licenses/mit-license.html
 */

#import "NSDateAdditions.h"

NSCalendar *currentCalendar_;

@implementation NSDate (KalAdditions)

+ (void) load {
    NSCalendar *dc = [NSCalendar currentCalendar];
    assignObject(currentCalendar_, dc);
}

+ (void) unload {
    freeObject(currentCalendar_);
}

+ (void) setCalendar:(NSCalendar *)calendar {
    assignObject(currentCalendar_, calendar);
}

- (NSDate *)cc_dateByMovingToBeginningOfDay
{
  unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
  NSDateComponents* parts = [currentCalendar_ components:flags fromDate:self];
  [parts setHour:0];
  [parts setMinute:0];
  [parts setSecond:0];
  return [currentCalendar_ dateFromComponents:parts];
}

- (NSDate *)cc_dateByMovingToEndOfDay
{
  unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
  NSDateComponents* parts = [currentCalendar_ components:flags fromDate:self];
  [parts setHour:23];
  [parts setMinute:59];
  [parts setSecond:59];
  return [currentCalendar_ dateFromComponents:parts];
}

- (NSDate *)cc_dateByMovingToFirstDayOfTheWeek {
	NSDate *d = nil;
	BOOL ok = [currentCalendar_ rangeOfUnit:NSWeekCalendarUnit startDate:&d interval:NULL forDate:self];
	NSAssert1(ok, @"Failed to calculate the first day the week based on %@", self);
	return d;
}

- (NSDate *)cc_dateByMovingToLastDayOfTheWeek {
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.day = -1;
	return [currentCalendar_ dateByAddingComponents:c toDate:[self cc_dateByMovingToFirstDayOfTheFollowingWeek] options:0];
}

- (NSDate *)cc_dateByMovingToFirstDayOfThePreviousWeek {
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.week = -1;
	return [[currentCalendar_ dateByAddingComponents:c toDate:self options:0] cc_dateByMovingToFirstDayOfTheWeek]; 
}

- (NSDate *)cc_dateByMovingToFirstDayOfTheFollowingWeek {
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.week = 1;
	return [[currentCalendar_ dateByAddingComponents:c toDate:self options:0] cc_dateByMovingToFirstDayOfTheWeek];
}

- (NSDate *)cc_dateByMovingToFirstDayOfTheMonth
{
  NSDate *d = nil;
  BOOL ok = [currentCalendar_ rangeOfUnit:NSMonthCalendarUnit startDate:&d interval:NULL forDate:self];
  NSAssert1(ok, @"Failed to calculate the first day the month based on %@", self);
  return d;
}

- (NSDate *)cc_dateByMovingToLastDayOfTheMonth
{
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.day = -1;
	return [currentCalendar_ dateByAddingComponents:c toDate:[self cc_dateByMovingToFirstDayOfTheFollowingMonth] options:0];
}
	
- (NSDate *)cc_dateByMovingToFirstDayOfThePreviousMonth
{
  NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
  c.month = -1;
  return [[currentCalendar_ dateByAddingComponents:c toDate:self options:0] cc_dateByMovingToFirstDayOfTheMonth];  
}

- (NSDate *)cc_dateByMovingToFirstDayOfTheFollowingMonth
{
  NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
  c.month = 1;
  return [[currentCalendar_ dateByAddingComponents:c toDate:self options:0] cc_dateByMovingToFirstDayOfTheMonth];
}

- (NSDate *)cc_dateByMovingToFirstDayOfTheQuarter {
	NSDate *d = nil;
	BOOL ok = [currentCalendar_ rangeOfUnit:NSQuarterCalendarUnit startDate:&d interval:NULL forDate:self];
	NSAssert1(ok, @"Failed to calculate the first day the quarter based on %@", self);
	return d;
}

- (NSDate *)cc_dateByMovingToLastDayOfTheQuarter {
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.day = -1;
	return [currentCalendar_ dateByAddingComponents:c toDate:[self cc_dateByMovingToFirstDayOfTheFollowingQuarter] options:0];
}

- (NSDate *)cc_dateByMovingToFirstDayOfThePreviousQuarter {
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.month = -3;
	return [[currentCalendar_ dateByAddingComponents:c toDate:self options:0] cc_dateByMovingToFirstDayOfTheQuarter];
}

- (NSDate *)cc_dateByMovingToFirstDayOfTheFollowingQuarter {
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.month = 3;
	return [[currentCalendar_ dateByAddingComponents:c toDate:self options:0] cc_dateByMovingToFirstDayOfTheQuarter];
}

- (NSDate *)cc_dateByMovingToFirstDayOfTheYear {
	NSDate *d = nil;
	BOOL ok = [currentCalendar_ rangeOfUnit:NSYearCalendarUnit startDate:&d interval:NULL forDate:self];
	NSAssert1(ok, @"Failed to calculate the first day the year based on %@", self);
	return d;
}

- (NSDate *)cc_dateByMovingToLastDayOfTheYear {
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.day = -1;
	return [currentCalendar_ dateByAddingComponents:c toDate:[self cc_dateByMovingToFirstDayOfTheFollowingYear] options:0];
}

- (NSDate *)cc_dateByMovingToFirstDayOfThePreviousYear {
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.year = -1;
	return [[currentCalendar_ dateByAddingComponents:c toDate:self options:0] cc_dateByMovingToFirstDayOfTheYear]; 
}

- (NSDate *)cc_dateByMovingToFirstDayOfTheFollowingYear {
	NSDateComponents *c = [[[NSDateComponents alloc] init] autorelease];
	c.year = 1;
	return [[currentCalendar_ dateByAddingComponents:c toDate:self options:0] cc_dateByMovingToFirstDayOfTheYear];
}

- (NSDateComponents *)cc_componentsForMonthDayAndYear
{
  return [currentCalendar_ components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
}

- (NSUInteger)cc_weekday
{
  return [currentCalendar_ ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
}

- (NSUInteger)cc_numberOfDaysInMonth
{
  return [currentCalendar_ rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length;
}

@end
