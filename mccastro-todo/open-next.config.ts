// default open-next.config.ts file created by @opennextjs/cloudflare

const config = {
  default: {
    override: {
      wrapper: "cloudflare-node",
      converter: "edge",
      incrementalCache: "dummy",
      tagCache: "dummy",
      queue: "dummy",
      proxyExternalRequest: "fetch",
    },
  },

  middleware: {
    external: true,
    override: {
      wrapper: "cloudflare-edge",
      converter: "edge",
      proxyExternalRequest: "fetch",
    },
  },

  edgeExternals: ["node:crypto"],

  dangerous: {
    enableCacheInterception: false,
  },
};

export default config;
