/*
 * Copyright 2013 appscape gmbh
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#import "RMBTPing.h"

@implementation RMBTPing

- (id)initWithServerNanos:(uint64_t)serverNanos
              clientNanos:(uint64_t)clientNanos
   relativeTimestampNanos:(uint64_t)timestampNanos {
    if (self = [super init]) {
        _serverNanos = serverNanos;
        _clientNanos = clientNanos;
        _relativeTimestampNanos = timestampNanos;
    }
    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"RMBTPing (server=%" PRIu64 ", client=%" PRIu64 ")",
            _serverNanos,
            _clientNanos];
}

- (NSDictionary*)testResultDictionary {
    return @{
      @"value_server": [NSNumber numberWithUnsignedLongLong:_serverNanos],
      @"value":        [NSNumber numberWithUnsignedLongLong:_clientNanos],
      @"time_ns":      [NSNumber numberWithUnsignedLongLong:_relativeTimestampNanos],
    };
}

@end
