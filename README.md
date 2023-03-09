# Amazon Vine Review Analysis

## Overview

In order to review whether or not reviews from the Amazon vine members were biased, we extracted the data, and used PySpark to transform and export the data to a postgres database connecting it through an AWS RDS instance. 

## Results

### Paid Reviews

  - There were 170 paid reviews
  - Of the 170 paid reviews, 65 were 5 stars
  - The percent of paid reviews that were 5 star is 38.23%
![vine_member_reviews](https://user-images.githubusercontent.com/116474586/223917001-cb25c93e-e73f-4836-87c4-5c1b12276097.png)

### Non Paid Reviews

  - There were 37840 non paid reviews
  - Of the 37840 reviews, 20612 were 5 stars
  - The percent of paid reviews that were 5 star
  ![non_vine_member_reviews](https://user-images.githubusercontent.com/116474586/223916991-ae5ce981-2c0b-4a90-9b08-12eaf26d04d0.png)

## Summary

Looking at the percent of five star vd non five star reviews between the 2 types of reviews, the non paid reviews had a higher percent of 5 star than the paid reviews. This indicates that the paid reviews are not biased, and are reliable. To further dive into the reviews, I would also compare the reviews against verified purchases, and see if the proportion of five star reviews changes when looking at the verified purchase reviews.
