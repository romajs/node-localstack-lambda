const pino = require('pino')

const logger = pino({ level: 'debug', prettyPrint: true, useLevelLabels: true })

logger.info('Environment:', process.env.NODE_ENV)

const handler = message => {
  logger.debug('Receveid message:', message)
}

module.exports = {
  handler,
}
