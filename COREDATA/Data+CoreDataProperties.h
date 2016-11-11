//
//  Data+CoreDataProperties.h
//  COREDATA
//
//  Created by Student P_08 on 07/11/16.
//  Copyright © 2016 akshay. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *surname;

@end

NS_ASSUME_NONNULL_END
