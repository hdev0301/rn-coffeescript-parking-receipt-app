{createIconSet} = require 'react-native-vector-icons'

glyphMap = require 'src/res/extra-icons-config.json'

module.exports = createIconSet(glyphMap, 'ExtraIcons', 'ExtraIcons.ttf')
module.exports.glyphMap = glyphMap
