/** 
 * Error.m
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
 
// <Error>
 	// 	<Code></Code>
 	// 	<Description></Description>
 	// </Error>
 
#import  "Error.h";
#import  "CXMLNode.h";


@implementation Error 
@synthesize nsMappings;
@synthesize xml;
@synthesize xmlString;

-(id)initFromXMLString:(NSString*)aStr{
	CXMLDocument *resDoc = [[[CXMLDocument alloc] initWithXMLString:aStr options:0 error:nil] autorelease];
	return [self initWithXML:[resDoc rootElement]];
}

-(NSString*) xmlString{
	if( xmlString == nil){
		self.xmlString = [self serializeToXMLString:nil nameSpaces:nil];
	}
	return xmlString;
}

@synthesize description_var;
@synthesize description_var_XMLNAME;
- (NSString*) description_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( description_var == nil){
		self.description_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,description_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return description_var;
}

@synthesize code_var;
@synthesize code_var_XMLNAME;
- (NSString*) code_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( code_var == nil){
		self.code_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,code_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return code_var;
}



- (id)initWithXML:(CXMLNode*)axml { 
	if(self = [super init]){
		nsMappings = [[NSMutableDictionary alloc] init];
		NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];
		if( prefix == nil){
			prefix = [XMLUtil makePrefix:nsMappings];
		}
		[nsMappings setObject:[self getURI] forKey:prefix];
		self.xml=axml;
		id var=nil;
		id res=nil;
	    self.description_var_XMLNAME=@"Description";
	self.description_var=nil;
	    self.code_var_XMLNAME=@"Code";
	self.code_var=nil;
			}
	return self;
}

- (void)dealloc {
	[description_var_XMLNAME release];
	[description_var release];
	[code_var_XMLNAME release];
	[code_var release];
	[nsMappings release];
	[xml release];

    [super dealloc];
}

- (NSString *)serializeToXMLString:(NSString *)elemName nameSpaces:(NSMutableDictionary *)nameSpaces{
	
		NSMutableString *serializedForm = [NSMutableString string];
		NSString *prefix = [XMLUtil getNewNSPrefix:nameSpaces forURI:[self getURI]];
		NSString *elName = elemName ? elemName : [self getDefaultElementName];
		if( prefix != nil){
			[serializedForm appendFormat:@"<%@ xmlns=\"%@\"", elName,[self getURI]];
		}
		else{
			[serializedForm appendFormat:@"<%@",elName];
		}
	
		[serializedForm appendString:[self serializedAttributeString]];
		[serializedForm appendFormat:@">"];
		[serializedForm appendString:[self serializedElementString:nameSpaces]];
	
		if( prefix != nil){
			[serializedForm appendFormat:@"</%@>", elName];
		}
		else{
			[serializedForm appendFormat:@"</%@>",elName];
		}
		return serializedForm;
	
	}
	- (NSString *)serializedAttributeString{
		NSMutableString *serializedForm = [NSMutableString string];
				return serializedForm;
	}
	- (NSString *)serializedElementString:(NSMutableDictionary *)nameSpaces
	{
		NSMutableString *serializedForm = [NSMutableString string];
		
						if(self.description_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.description_var_XMLNAME,self.description_var,self.description_var_XMLNAME];
				 	} 
		  
						if(self.code_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.code_var_XMLNAME,self.code_var,self.code_var_XMLNAME];
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"Error";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
