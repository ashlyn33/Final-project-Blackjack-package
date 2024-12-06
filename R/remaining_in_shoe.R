#' Function to check how many cards remain in the shoe throughout game play
#'
#' Simple function for the user to check how many cards remain in the shoe.
#'
#'@details
#'Since the shoe does not reset after each hand, the user is able to call this function between hands to check how many cards are remaining in the current shoe. When the number of cards in the shoe gets low, the shoe will need to be reset using the `new_card_shoe()` function.
#'
#' @export
remaining_in_shoe <- function() {
  cat("Number of cards remaining in the shoe:", nrow(shoe), "\n")
}
