# movie_app

## Overview
The Movie App is a Flutter-based mobile application that allows users to explore popular movies.
It fetches movie data from The Movie Database (TMDb) API, presenting detailed information about each movie, including titles, descriptions, ratings, and poster images. The app features a user-friendly interface that enhances the movie browsing experience.
# Features
* Popular Movies: Display a list of popular movies fetched from the TMDb API.
* Movie Details: View detailed information about each movie/
Image Display: Show high-quality movie posters/
Responsive Design: The app is designed to be responsive, adapting to various screen sizes and orientations.
## How i worked on this project :
1-used clean arch for the project by divide every use case into fetcher\
2-implement Auth fetcher  include (login & register view, formkey validate)
* In home View :
  
3- implement Apis using dio package and return popularMovie model\
 
4-implement (provider) package to mange states of response model data\
5-implement (cached_network_image) package to provide image\
  6-implement (either_dart) package to handel states of  <error or response>\
  7-used Named routes to navigate during app\
   8-implement (easy_localization) package to translate app\
   * inhance:\
   9-implement interceptor before request\
   10-using service locator get_it to solve dependency\
   11-use theme of material\
   12-pagination
   


