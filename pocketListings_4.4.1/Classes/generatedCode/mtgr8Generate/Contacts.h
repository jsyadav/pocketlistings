/** 
 * Contacts.h
 *
 * Copyright mTgr8 Inc. <2010>  <idebroy@mtgr8.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 **/

#import <Foundation/Foundation.h>
#import "TouchXML.h"
#import "XMLUtil.h"
#import "XMLAble.h"


@interface Contacts : 
  	NSObject <XMLAble>
 {

        NSMutableDictionary* nsMappings;
        CXMLNode* xml;
        NSString* xmlString;
	   NSMutableArray* contact_var;
	NSString* contact_var_XMLNAME;


	   NSNumber* totalcount_avar;
	NSString* totalcount_avar_XMLNAME;

	   NSNumber* count_avar;
	NSString* count_avar_XMLNAME;

}

@property (readwrite,retain) NSMutableDictionary* nsMappings;
@property (readwrite,retain) CXMLNode* xml;
@property (nonatomic,readwrite,retain) NSString* xmlString;

	   @property (nonatomic,readwrite,retain) NSMutableArray* contact_var;
	
	@property (readwrite,retain) NSString* contact_var_XMLNAME;

	   @property (nonatomic,readwrite,retain) NSNumber* totalcount_avar;
	
	@property (nonatomic,readwrite,retain) NSString* totalcount_avar_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSNumber* count_avar;
	
	@property (nonatomic,readwrite,retain) NSString* count_avar_XMLNAME;


- (id)initWithXML:(CXMLNode*)xml;
@end