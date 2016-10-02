# ![](./metro.gif) Simetro

_The ultimate metro trip planner_

It's your job to calculate the total number of stops between two Metro
stations.

## Step 1 - Connect the CSS file

Add a `link` tag to the `head` of layout.erb

## Step 2 - Define a trip route

When visiting http://localhost:4567/trip in the browser, Sinatra
responds with a 404.

Create a `get` route to respond to `get` requests to `/trip`

Create an instance variable `@num_stops`, and set it equal to the number
of stops between the `start` and `end` stations.

<details>
  <summary>Click here for a hint</summary>
  1. get the index of the start station from `metro` at `params[:line]`<br>
  2. get the index of the end station from `metro` at `params[:line]`
  3. Subtract them and set them equal to `@num_stops`
</details>

#### Note: Sinatra will not render numbers.

(If you're testing this out before creating the view)

```rb
get '/' do
  1 # must be "1"
end
```

## Step 3 - Create a trip view

Create a new file in `views/trip.erb`. To show the trip results.

## Bonus !

Allow the user to select any two stops, without selecting a line. Calculate
the total number of stops between the two stations, and tell the user which
station to switch lines at.
