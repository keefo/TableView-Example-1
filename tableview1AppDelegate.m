//
//  Tableview1AppDelegate.m
//  Tableview Example 1
//  This example shows how to setup a NSTableView object programmatically
//
//  Created by Liam on 10-03-15.
//  Copyright 2010 __Beyondcow Inc__. All rights reserved.
//

#import "tableview1AppDelegate.h"

#define FULLSIZE (NSViewMinXMargin | NSViewWidthSizable | NSViewMaxXMargin | NSViewMinYMargin | NSViewHeightSizable | NSViewMaxYMargin)

@implementation tableview1AppDelegate

- (void)addColumn:(NSString*)newid withTitle:(NSString*)title
{
	NSTableColumn *column=[[NSTableColumn alloc] initWithIdentifier:newid];
	[[column headerCell] setStringValue:title];
	[[column headerCell] setAlignment:NSCenterTextAlignment];
	[column setWidth:100.0];
	[column setMinWidth:50];
	[column setEditable:NO];
	[column setResizingMask:NSTableColumnAutoresizingMask | NSTableColumnUserResizingMask];
	[tableView addTableColumn:column];
	[column release];
}

- (void)awakeFromNib
{
	
	NSRect frame=[window frame];
	
	frame.origin.y+=25;
	frame.size.height-=25;
	
	tableData=[[NSMutableArray alloc] init];
	
	NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
	[dic setObject:@"hahah" forKey:@"1"];
	[dic setObject:@"125" forKey:@"2"];
	[dic setObject:@"10" forKey:@"3"];
	[dic setObject:@"10/125" forKey:@"4"];
	[tableData addObject:dic];
	[dic release];
	dic=[[NSMutableDictionary alloc] init];
	[dic setObject:@"Hello" forKey:@"1"];
	[dic setObject:@"150" forKey:@"2"];
	[dic setObject:@"20" forKey:@"3"];
	[dic setObject:@"20/150" forKey:@"4"];
	[tableData addObject:dic];
	[dic release];
	
	NSScrollView *scrollView=[[NSScrollView alloc] initWithFrame:frame];
	[scrollView setAutoresizingMask:FULLSIZE];
	[scrollView setBackgroundColor:[NSColor redColor]];
	
	frame.size.height-=16;
	tableView = [[NSTableView alloc] initWithFrame:frame];
	[tableView setAutosaveName:@"downloadTableView"];
	
	frame.origin.y=frame.size.height;
	frame.size.height=17;
	
	NSTableHeaderView *tableHeadView=[[NSTableHeaderView alloc] initWithFrame:frame];
	[tableView setHeaderView:tableHeadView];
	[tableHeadView release];
	
	[tableView setAutoresizesSubviews:FULLSIZE];
	[tableView setBackgroundColor:[NSColor whiteColor]];
	[tableView setGridColor:[NSColor lightGrayColor]];
	[tableView setGridStyleMask: NSTableViewSolidHorizontalGridLineMask];
	[tableView setUsesAlternatingRowBackgroundColors:YES];
	[tableView setAutosaveTableColumns:YES];
	[tableView setAllowsEmptySelection:YES];
	[tableView setAllowsColumnSelection:YES];
	
	[self addColumn:@"1" withTitle:@"Name"];
	[self addColumn:@"2" withTitle:@"Size"];
	[self addColumn:@"3" withTitle:@"Get"];
	[self addColumn:@"4" withTitle:@"Bar"];
	[self addColumn:@"5" withTitle:@"ABc"];

	[tableView setDataSource:self];
	[scrollView setDocumentView:tableView];
	
	[window setContentView:scrollView];
	[scrollView release];
}

#pragma mark NSTableViewDataSource Delegate

- (int)numberOfRowsInTableView:(NSTableView *)aTableView
{
	return [tableData count];
}

- (id)tableView: (NSTableView *)theTableView objectValueForTableColumn: (NSTableColumn *)theColumn row: (int)rowIndex
{
	NSParameterAssert(rowIndex >= 0 && rowIndex < [tableData count]);
	return [[tableData objectAtIndex:rowIndex] objectForKey:[theColumn identifier]];
}

#pragma mark NSApplication Delegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (void)dealloc
{
	[tableView release];
	[tableData release];
    [super dealloc];
}
@end
