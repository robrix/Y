// clang Y.m -o Y -fobjc-arc -framework Foundation

#import <Foundation/Foundation.h>
#import <stdio.h>

typedef id (^Yblock)(id);

int main(int argc, const char *argv[]) {
	@autoreleasepool {
		Yblock Y = (Yblock)^(Yblock f) {
			return (^(Yblock x) {
				return ^(id arg) { return ((Yblock(^)(Yblock))f)(x(x))(arg); };
			})((Yblock)^(Yblock x) {
				return ^(id arg) { return ((Yblock(^)(Yblock))f)(x(x))(arg); };
			});
		};
		
		Yblock factorial = Y(^(Yblock f) {
			return ^(NSNumber *number) {
				unsigned n = [number unsignedIntValue];
				if(n <= 0)
					return [NSNumber numberWithUnsignedInt:1];
				else
					return [NSNumber numberWithUnsignedInt:n * [f([NSNumber numberWithUnsignedInt:n - 1]) unsignedIntValue]];
			};
		});
		
		printf("%s\n", [[factorial([NSNumber numberWithUnsignedInt:5]) description] UTF8String]);
	};
	return 0;
}