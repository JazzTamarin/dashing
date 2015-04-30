class Dashing.Map extends Dashing.Widget

    ready: ->
        $(@node).removeClass('widget')
        color = $(@node).data("color")

        if color
            style = [
                {
                    "featureType": "water",
                    "stylers": [
                        { "color": color }
                    ]
                },{
                    "featureType": "road",
                    "stylers": [
                        { "color": color },
                        { "weight": 0.5 }
                    ]
                },{
                    "featureType": "poi.government",
                    "stylers": [
                        { "lightness": 95 },
                        { "visibility": "off" }
                    ]
                },{
                    "featureType": "transit",
                    "stylers": [
                        { "color": "#ffffff" }
                    ]
                },{
                    "featureType": "transit",
                    "elementType" : "geometry",
                    "stylers": [
                        { "weight": 0.5 }
                    ]
                },{
                    "featureType": "transit",
                    "elementType": "labels",
                    "stylers": [
                        { "visibility": "off" }
                    ]
                },{
                    "featureType": "road",
                    "elementType": "labels",
                    "stylers": [
                        { "visibility": "off" }
                    ]
                },{
                    "featureType": "poi",
                    "elementType": "labels",
                    "stylers": [
                        { "visibility": "off" }
                    ]
                },{
                    "featureType": "administrative.land_parcel"    },{
                    "featureType": "poi.park",
                    "stylers": [
                        { "lightness": 90 },
                        { "color": "#ffffff" }
                    ]
                },{
                    "featureType": "landscape",
                    "stylers": [
                        { "color": "#ffffff" },
                        { "visibility": "on" }
                    ]
                },{
                    "featureType": "poi.park",
                    "stylers": [
                        { "color": "#ffffff" }
                    ]
                },{
                    "featureType": "landscape.man_made",
                    "stylers": [
                        { "color": color },
                        { "lightness": 95 }
                    ]
                },{
                    "featureType": "poi",
                    "stylers": [
                        { "visibility": "on" },
                        { "color": "#ffffff" }
                    ]
                },{
                    "featureType": "poi",
                    "elementType": "labels",
                    "stylers": [
                        { "visibility": "off" }
                    ]
                },{
                    "featureType": "landscape",
                    "elementType": "labels",
                    "stylers": [
                        { "visibility": "off" }
                    ]
                },{
                    "featureType": "administrative.province",
                    "elementType": "labels",
                    "stylers": [
                        { "visibility": "off" }
                    ]
                },{
                    "elementType": "administrative.locality",
                    "elementType": "labels",
                    "stylers": [
                        { "color": "#000000" },
                        { "weight": 0.1 }
                    ]
                },{
                    "featureType": "administrative.country",
                    "elementType": "labels.text",
                    "stylers": [
                        { "color": "#000000" },
                        { "weight": 0.1 }
                    ]
                },{
                    "featureType": "administrative.country",
                    "elementType": "geometry",
                    "stylers": [
                        { "color": color },
                        { "weight": 1.0 }
                    ]
                },{
                    "featureType": "administrative.province",
                    "elementType": "geometry",
                    "stylers": [
                        { "color": color },
                        { "weight": 0.5 }
                    ]
                },{
                    "featureType": "water",
                    "elementType": "labels",
                    "stylers": [
                        { "visibility": "off" }
                    ]
                }
            ]
        else
            []

        options =
            zoom: 2
            center: new google.maps.LatLng(30, -98)
            disableDefaultUI: true
            draggable: false
            scrollwheel: false
            disableDoubleClickZoom: true
            styles: style

        mapTypeId: google.maps.MapTypeId.ROADMAP
        @map = new google.maps.Map $(@node)[0], options
        @heat = []

        @markers = [] #used for storing references to the markers
        
                
    onData: (data) ->
        # don't do anything if the global map didn't init
        return unless @map    
        #test code 
        marker_object3 = new google.maps.Marker
            position: new google.maps.LatLng(35,110)
            map: @map #once this is set the marker is added to the map
        @markers.push marker_object3
        
        marker_object2 = new google.maps.Marker
            position: new google.maps.LatLng(10,110)
            map: @map
        @markers.push marker_object2
       
        
        # deal with heat map. not us, not yet
        if $(@node).data("type") == 'heat'
        #
        #    marker.set('map', null) for marker in @heat
        #    @markers = []

        #    @markers.push new google.maps.LatLng(marker[0],marker[1]) for marker in data.markers

        #    pointArray = new google.maps.MVCArray @markers
        #    @heat.push new google.maps.visualization.HeatmapLayer
        #        data: pointArray
        #        map: @map
        #
        
        # push coords into map. edit here 
        else
            #console.log typeof @markers[0] #returns 'object', very helpful
            
            #the API was updated
            #old
            #marker.set('map', null)
            #new - still doesn't work
            #marker.setMap(null) for marker in @markers 
            #seems like the only way to remove markers from the map is to set the map property to null
            #marker.map = null #doesn't work either
            
            #
            #for marker in @markers
            #  console.log(Object.getOwnPropertyNames(marker)); #prints Array [ "0", "1", "length" ]
            for marker in @markers
                console.log(marker[0])
            #while i < @markers.length
                # console.log @markers[i] instanceof google.maps.Marker # returns false 
                #(@markers[i]).setMap null #this line breaks the code
                #i++
                    
            #@markers = [] # clears the collection of markers
            
            for marker in data.markers
                marker_object = new google.maps.Marker
                    position: new google.maps.LatLng(marker[0],marker[1])
                    map: @map #once this is set the marker is added to the map
                    animation: google.maps.Animation.DROP
                    #can pick an image as well
                @markers.push marker_object
            
        #rest of the code was dealing with panning the map - was removed