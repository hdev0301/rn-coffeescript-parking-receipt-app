VerifiedStatus = 1


getBonuses = (state) ->
  state.bonuses.toList()
    .sortBy (bonus) ->
      -bonus.get('date').getTime()


bonusPoints = (bonuses) ->
  sumVerified = (all, bonus) ->
    points = bonus.get('points')
    status = bonus.get('status')

    if status isnt VerifiedStatus
      return all

    all + points


  bonuses.reduce(sumVerified, 0)
  
  
module.exports = {
  getBonuses
  bonusPoints
}
