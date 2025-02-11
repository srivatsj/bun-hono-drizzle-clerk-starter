/*
 Copyright 2024 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "unstable"; # or "stable-24.05"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.bun,
    pkgs.docker
  ];
  services.docker.enable = true;
  # Sets environment variables in the workspace
  env = {
    DATABASE_URL="postgressql://user:password@localhost:5432/db";
    PORT="3000";
    HOST="0.0.0.0";
  };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [];
    workspace = {
      onCreate = {
        install = ''
            bun init -y
            bun add drizzle-orm hono @hono/clerk-auth @clerk/backend
            bun add -D drizzle-kit
          '';
        # Open editors for the following files by default, if they exist:
        default.openFiles = ["server/main.ts"];
      };
      onStart = {
        start = "docker compose up -d"
      };
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["bun" "run" "--hot" "server/main.ts"];
          manager = "web";
        };
      };
    };
  };
}