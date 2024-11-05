const fastify = require('fastify')({ logger: true });

fastify.get('/hello', async (request, reply) => {
  return { msg: 'Hello World from Fastify' };
});

fastify.listen(3001, (err, address) => {
  if (err) {
    fastify.log.error(err);
    process.exit(1);
  }
  fastify.log.info(`Server listening on ${address}`);
});
