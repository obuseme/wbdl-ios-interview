
WB Fan Engagement Team Interview Challenge
================================== 

Welcome to the WB Fan Engagement Team interview practice project. 

### Your Task

On a high level, your task is to create an app that fetches and displays Marvel comic book data. 

### Data
First, you're going to need some data. Use the [Marvel API](https://developer.marvel.com/documentation/generalinfo) to create networking requests to access the JSON data

### App
To pass the test, the app has to include the following:

* Fetch comic series and display them. (https://developer.marvel.com/docs#!/public/getSeriesCollection_get_25)
* For each comic series you have to display **at least**:
	* [x]Title
	* [x]Thumbnail
	* [x]Number of comics
	* [x]Start and end date
* [x]The results should be sorted by start year.

* Each comic series result should be tappable and show a detail screen for the series. On the detail screen, you have to display **at least**:
	* A header view that shows at least:
		* [x]Comic series title
		* [x]Comic series thumbnail
		* [x]A couple of the characters in the series (https://developer.marvel.com/docs#!/public/getSeriesCharacterWrapper_get_27) including:
			* [x]Character name
			* [x]Character description
	* [x]The list books in the selected comic series (https://developer.marvel.com/docs#!/public/getComicsCollection_get_28)
	* For each comic book in the series, you have to display **at least**:
		* [x]Title
		* [x]Thumbnail
		* [x]Issue number
* Note: The detail screen requires two API calls - one for the first page of comics in the series, and one for the first page of characters in the series.  The UI of the screen should remain in a loading state until both API requests complete.

## Requirements
* [x]Use Swift 5.0 or above.
* [x]Use Auto Layout or SwiftUI
* [x]There should be no errors, warnings or crashes
* [x]The app should compile and run. If it needs additional setup, include instructions in the README.

## Bonus Points
* Wow us or teach us something with your code
* [x]Paginate through the API requests for comic series, or the books in a series
* [x]Use SwiftUI and/or Combine
* [x]Add automated tests
* [x]Use an iOS 15 API or Feature
* []Add local persistence for the data and synchronize it with the server
* [x]Don't use any 3rd party libraries

## Guidelines
* Keep your files short and sweet, use extensions and break out helpers when appropriate.
* It's important that the app follows a clear architecture pattern.
* Comment and document your code where appropriate.
* Feel free to use 3rd party libraries, but make sure to justify why you've used them in the README.
* Be consistent with your coding style. Feel free to adhere to the  [raywenderlich.com swift style guide](https://github.com/raywenderlich/swift-style-guide).
* Remove any unused or Apple-generated code

## Submission

* Clone this repo, create your own branch and [submit it as a PR](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## Any Questions

If you have any questions, comments or concerns, please email Andy Obusek at andrew.obusek@warnerbros.com  and Taher Saeed Taher.Saeed@warnerbros.com
