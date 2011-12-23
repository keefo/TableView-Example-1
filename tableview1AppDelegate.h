//
//  tableview1AppDelegate.h
//  tableview1
//
//  Created by liam on 10-03-15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface tableview1AppDelegate : NSObject {
	IBOutlet NSWindow	*window;
	NSTableView			*tableView;
	NSMutableArray		*tableData;
}

- (int)numberOfRowsInTableView:(NSTableView *)aTableView;
- (id)tableView: (NSTableView *)theTableView objectValueForTableColumn: (NSTableColumn *)theColumn row: (int)rowIndex;

@end
