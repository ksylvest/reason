# Reason

[![Version](https://img.shields.io/cocoapods/v/KSReason.svg?style=flat)](http://cocoapods.org/pods/KSReason)
[![License](https://img.shields.io/cocoapods/l/KSReason.svg?style=flat)](http://cocoapods.org/pods/KSReason)
[![Platform](https://img.shields.io/cocoapods/p/KSReason.svg?style=flat)](http://cocoapods.org/pods/KSReason)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

KSReason is available through [CocoaPods](http://cocoapods.org). To install it add the following line to your Podfile:

```ruby
pod "KSReason"
```

## Usage

### Enumerable

#### Iterating

**NSSet**
```objc
NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
[collection KS_each:^(NSString *object) {
  // ...
}];
```

**NSArray**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"alpha", @"sigma", @"omega", NULL];
[collection KS_each:^(NSString *object) {
  // ...
}];
```

**NSDictionary**
```objc
NSDictionary *collection = @{ @"alpha": @"alpha", @"omega": @"omega", @"sigma": @"sigma" };
[collection KS_each:^(NSString *object) {
  // ...
}];
```

#### Map

**NSSet**
```objc
NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
[collection KS_map:^NSString *(NSString *object) {
  // ex: NSString *mapping = [object reverse];
  return mapping;
}];
```

**NSArray**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"alpha", @"sigma", @"omega", NULL];
[collection KS_map:^NSString *(NSString *object) {
  // ex: NSString *mapping = [object reverse];
  return mapping;
}];
```

**NSDictionary**
```objc
NSDictionary *collection = @{ @"alpha": @"alpha", @"omega": @"omega", @"sigma": @"sigma" };
[collection KS_map:^NSString *(NSString *key, NSString *value) {
  // ex: NSString *mapping = [value reverse];
  return mapping;
}];
```

#### Reduce

**NSSet**
```objc
NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *object){
  return [NSString stringWithFormat:@"%@ %@", memo, object];
} memo:@"reduction:"];
```

**NSArray**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"alpha", @"sigma", @"omega", NULL];
NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *object){
  return [NSString stringWithFormat:@"%@ %@", memo, object];
} memo:@"reduction:"];
```

**NSDictionary**
```objc
NSArray *collection = [NSArray arrayWithObjects;@"alpha", @"sigma", @"omega", NULL];
NSString *reduction = [collection KS_reduce:^NSString *(NSString *memo, NSString *key, NSString *value){
  return [NSString stringWithFormat:@"%@ %@", memo, value];
} memo:@"reduction:"];
```

#### Find

**NSSet**
```objc
NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
NSString *element = [collection KS_find:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**NSArray**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"alpha", @"sigma", @"omega", NULL];
NSString *element = [collection KS_find:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**NSDictionary**
```objc
NSDictionary *collection = @{ @"alpha" : @"alpha", @"sigma": @"sigma", @"omega": @"omega" };
NSString *element = [collection KS_find:^BOOL (NSString *key, NSString *value) {
  return [key isEqualToString:@"..."];
}];
```

#### Any

**NSSet**
```objc
NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
BOOL any = [collection KS_any:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];

**NSArray**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"alpha", @"sigma", @"omega", NULL];
BOOL any = [collection KS_any:^BOOL (NSString *object) {
  return [object isEqualToString:@"..."];
}];
```

**NSDictionary**
```
NSDictionary *collection = @{ @"alpha" : @"alpha", @"sigma": @"sigma", @"omega": @"omega" };
BOOL any = [collection KS_any:^BOOL (NSString *key, NSString *value) {
  return [key isEqualToString:@"..."];
}];
```

#### Filter

**NSSet**
```objc
NSSet *collection = [NSSet setWithObjects:@"alpha", @"sigma", @"omega", NULL];
NSSet *filter = [collection KS_filter:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**NSArray**
```objc
NSArray *collection = [NSArray arrayWithObjects:@"alpha", @"sigma", @"omega", NULL];
NSArray *filtered = [collection KS_filter:^BOOL (NSString *object) {
  // ex.: BOOL match = [object isEqualToString:@"..."];
  return match;
}];
```

**NSDictionary**
```objc
NSDictionary *collection = @{ @"alpha" : @"alpha", @"sigma": @"sigma", @"omega": @"omega" };
NSDictionary *filtered = [collection KS_filter:^BOOL (NSString *key, NSString *value) {
  // ex.: BOOL match = [key isEqualToString:@"..."] || [value isEqualToString:@"..."];
  return match;
}];
```

## Author

Kevin Sylvestre, kevin@ksylvest.com

## License

KSReason is available under the MIT license. See the LICENSE file for more info.
