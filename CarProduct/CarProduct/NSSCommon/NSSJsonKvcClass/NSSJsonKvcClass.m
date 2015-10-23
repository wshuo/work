#import <objc/runtime.h>
#import "NSSJsonKvcClass.h"

@implementation NSSJsonKvcClass

const char *property_getTypeName(objc_property_t property)
{
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL)
    {
        if (attribute[0] == 'T')
        {
            size_t len = strlen(attribute);
            attribute[len - 1] = '\0';
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:len - 2] bytes];
        }
    }
    return "@";
}

- (NSString *)changePropertyType:(NSString*)proname
{
    return nil;
}

-(NSString*)getPropertyType:(NSString*)proname fatherObj:(id)fatherObj
{
    NSString *rltStr = nil;
    
    NSString *changeStr = [self changePropertyType:proname];
    if (changeStr)
    {
        rltStr = changeStr;
    }
    else
    {
        unsigned int propertyCount = 0;
        objc_property_t *properties = class_copyPropertyList([fatherObj class], &propertyCount);
        
        for (unsigned int i = 0; i < propertyCount; ++i)
        {
            objc_property_t property = properties[i];
            
            NSString *className = [NSString stringWithUTF8String:property_getTypeName(property)];
            NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
            if ([proname isEqualToString:propertyName])
            {
                if (![className isEqualToString:@"NSArray"])
                {
                   // rltStr = className;
                    rltStr =proname;
                    break;
                }
            
            }
        }
        free(properties);
    }
    
    return rltStr;
    
}

- (BOOL)isSelfClassProperty:(NSString *)name
{
    BOOL rlt = NO;
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; ++i)
    {
        objc_property_t property = properties[i];
        
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        if ([name isEqualToString:propertyName])
        {
            rlt = YES;
            break;
        }
    }
    free(properties);
    
    return rlt;
}

- (BOOL)parseWithDic:(NSDictionary *)dic
{
    NSArray *allkey = [dic allKeys];
    
    for (int i=0; i<[allkey count]; ++i)
    {
        NSString* key = [allkey objectAtIndex:i];
        
        id val = [dic objectForKey:key];
        
        if([val isKindOfClass:[NSNull class]])
        {
            continue;
        }
        
        if([val isKindOfClass:[NSDictionary class]])
        {
            //NSLog(@"%@",NSClassFromString([self getPropertyType:key fatherObj:self]));
            id obj = [[NSClassFromString([self getPropertyType:key fatherObj:self]) alloc] init];
            
            if(!obj)
            {
                continue;
            }
            
            [obj setJsonDataWithDic:val];
    
            if ([self isSelfClassProperty:key])
            {
                [self setValue:obj forKey:key];
            }
            
            obj = nil;
            
        }
        else if([val isKindOfClass:[NSArray class]])
        {
            
            NSString* arrayKey = [self getPropertyType:key fatherObj:self];
            
            if(arrayKey)
            {
                NSMutableArray* arry = [[NSMutableArray alloc] init];
                
                for (int i=0; i<[val count]; ++i)
                {
                    
                    id obj = [[NSClassFromString(arrayKey) alloc] init];
                    
                    if ([obj setJsonDataWithDic:[val objectAtIndex:i]])
                    {
                        [arry addObject:obj];
                    }
                    obj = nil;
                    
                }
                
                if ([self isSelfClassProperty:key])
                {
                    [self setValue:arry forKey:key];
                }
                
                arry = nil;
                
            }
            else
            {
                if ([self isSelfClassProperty:key])
                {
                    [self setValue:[NSMutableArray arrayWithArray:val] forKey:key];
                }
            }
        }
        else
        {
            NSString *str = [self changePropertyType:key];
            if (str)
            {
                if ([self isSelfClassProperty:str])
                {
                    [self setValue:val forKey:str];
                }
            }
            else
            {
                if ([self isSelfClassProperty:key])
                {
                    [self setValue:val forKey:key];
                }
            }
        }
        
    }
    
    return YES;
}

- (BOOL)setJsonDataWithDic:(NSDictionary *)jsonData
{
    BOOL rlt = NO;
    
    if ([jsonData isKindOfClass:[NSDictionary class]])
    {
        rlt = [self parseWithDic:jsonData];
    }
    else
    {
        rlt = NO;
    }
    
    return rlt;
}

- (NSDictionary*)getObjectData
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([self class], &propsCount);
    
    for(int i = 0;i < propsCount; i++)
    {
        
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [self valueForKey:propName];
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];
        }
        //该字段不是继承NSSJsonKvcClass，舍弃
        if (value)
        {
            NSString *str = [self changePropertyType:propName];
            if (str)
            {
                [dic setObject:value forKey:str];
            }
            else
            {
                [dic setObject:value forKey:propName];
            }
        }
    }
    
    free(props);
    return dic;
}

- (NSData*)getJSONOptions:(NSJSONWritingOptions)options error:(NSError**)error
{
    return [NSJSONSerialization dataWithJSONObject:[self getObjectData] options:options error:error];
}

- (id)getObjectInternal:(id)obj
{
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    if ([obj isKindOfClass:[NSSJsonKvcClass class]])
    {
        return [obj getObjectData];
    }
    return nil;
}
@end
