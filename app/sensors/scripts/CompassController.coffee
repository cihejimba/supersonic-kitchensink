angular
  .module('sensors')
  .controller 'CompassController', ($scope, supersonic) ->

    # Compass reading
    $scope.reading = 0

    # Are we watching reading?
    $scope.isWatching = false

    # This function listens to compass value changes
    supersonic.device.compass.watchHeading().onValue (heading) ->
      if $scope.isWatching
        $scope.$apply () ->
          $scope.reading = heading.magneticHeading

    # Start updating the view when view becomes visible
    supersonic.ui.views.current.whenVisible ->
      $scope.isWatching = true

    # Stop updating the view when view is hidden
    supersonic.ui.views.current.whenHidden ->
      $scope.isWatching = false
