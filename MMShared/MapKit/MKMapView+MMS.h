//
//  MKMapView+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 20/04/2015.
//  Copyright (c) 2015 Malcolm Hall. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <MMShared/MMSDefines.h>

@interface MKMapView (MMS)

- (void)mms_setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;

- (MKCoordinateRegion)mms_coordinateRegionWithMapView:(MKMapView *)mapView
                                centerCoordinate:(CLLocationCoordinate2D)centerCoordinate
                                    andZoomLevel:(NSUInteger)zoomLevel;

- (double)mms_zoomLevel;

- (void)mms_setVisibleMapRectToAnnotations;
- (void)mms_setVisibleMapRectToAnnotationsAnimated:(BOOL)animated;

@end
