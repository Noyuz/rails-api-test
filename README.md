# Basic API Rails Test

This repository is a test for basic API-only rails knowledge.

## Requirements

You need ruby 2.7.x to run this, as well as bundler.

## Setup

```
bundle install
bundle exec rails db:drop
bundle exec rails db:setup
```

## Tasks

1. Implement stats action for each student. It will compute their maximum and minimum scores, as well as their median and averages. - [Students Controller](/app/controllers/api/v1/students_controller.rb)

2. Route the stats action made in task 1 to `/api/v1/students/:id/stats` - [Routes file](/config/routes.rb)

3. Implement a query parameter which will filter the stats by subject. For example, `/api/v1/students/:id/stats?subject=math` will display stats for the "math" subject. - [Students Controller](/app/controllers/api/v1/students_controller.rb)

4. Fix the subject stats action `/api/v1/:subject/stats` so that it returns the proper pondered scores out of 20 points.
For example, if there is two tests for a subject, and we have 10/20 and 30/40, the proper average should be (10+(30/2))/2 = 12 and **not** (10+30)/2 = 30
