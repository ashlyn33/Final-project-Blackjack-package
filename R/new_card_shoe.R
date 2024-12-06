#' User request for dealer to shuffle a new shoe of 208 cards for game play
#'
#' This is the starting point before game play. In order to start playing the game with `blackjack()`, the user must start by requesting that the dealer prepare the shoe using this function.
#'
#'@details
#'This is a user implemented function to call before beginning the game for the first time, whenever the shoe is empty, or if the user would like to restart with a new shoe at any time.
#'
#'@export
new_card_shoe <- function() {
  shoe <- shuffled.shoe()
  assign("shoe", shoe, envir = .GlobalEnv)
  cat("The dealer has set up a new shoe with 4 decks of cards. Start playing blackjack now with `blackjack()`. Good luck!")
}
