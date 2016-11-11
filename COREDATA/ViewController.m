//
//  ViewController.m
//  COREDATA
//
//  Created by Student P_08 on 07/11/16.
//  Copyright © 2016 akshay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchdata];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)button:(id)sender {
    
    NSManagedObjectContext * context=[self managedObjectContext];
    NSManagedObject *newName=[NSEntityDescription insertNewObjectForEntityForName:@"Data" inManagedObjectContext:context];
    NSString *name=self.name.text;
    NSString *surname=self.surname.text;
    [newName setValue:name forKey:@"name"];
    [newName setValue:surname forKey:@"surname"];
    NSError *error;
    
    if ([context save:&error]) {
        NSLog(@"Saved");
        
    }
    else{
        NSLog(@"Data not saved");
    }
    [self fetchdata];
    
    
}

-(void)fetchdata
{
    NSManagedObjectContext *context=[self managedObjectContext];
    NSFetchRequest *fetch=[[NSFetchRequest alloc]initWithEntityName:@"Data"];
    NSError *error;
    Data=[[context executeFetchRequest:fetch error:&error]mutableCopy];
    if(error)
    {
        NSLog(@"%@",error.localizedDescription);
    }
    else{
        NSLog(@"fetched");
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Data.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    NSManagedObject *object=[Data objectAtIndex:indexPath.row];
    
    cell.textLabel.text=[object valueForKey:@"name"];
    cell.detailTextLabel.text=[object valueForKey:@"surname"];

    return cell;
}

@end













