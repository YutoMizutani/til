## React x TypeScript x Storybook

```sh
npm install -g create-react-app && npx create-react-app hello --typescript && cd hello \
&& echo "Referenced from [Storybook V5+React+TypeScriptで環境構築](https://qiita.com/otanu/items/dd06d6702f673268c74e)" \
&& npx -p @storybook/cli sb init \
&& yarn add -D @storybook/addon-knobs \
  @storybook/addon-viewport \
  @storybook/addon-storysource \
  react-docgen-typescript-loader \
  @storybook/addon-info \
  @storybook/addon-console \
&& yarn add -D @types/storybook__react \
  @types/storybook__addon-info \
  @types/storybook__addon-actions \
  @types/storybook__addon-knobs \
&& cat << 'EOT' >> ./storybook/addons.js
import '@storybook/addon-actions/register';
import '@storybook/addon-links/register';
import '@storybook/addon-knobs/register';
import '@storybook/addon-viewport/register';
import '@storybook/addon-storysource/register';
import '@storybook/addon-console';
EOT \
&& cat << 'EOT' > .storybook/webpack.config.js
const path = require("path");
module.exports = ({ config }) => {
  config.module.rules.push({
    test: /\.(ts|tsx)$/,
    use: [
      {
        loader: require.resolve("react-docgen-typescript-loader")
      },
      {
        loader: require.resolve('@storybook/addon-storysource/loader'),
        options: { parser: 'typescript' }
      }
    ]
  });
  config.resolve.extensions.push(".ts", ".tsx");
  return config;
};
EOT \
&& cat << 'EOT' > src/component/Example/index.tsx
import React, { useState, useCallback } from "react";

export interface ExampleProps {
  /** 表示するテキスト */
  text: string;
  /**
   * true: テキスト表示 false: テキスト非表示
   * @default false
   */
  flag?: boolean;
  /** ボタンを押した時のイベントハンドラ */
  action(): void;
}

const Example = (props: ExampleProps) => {
  const { text, flag, action } = props;
  const [count, countChg] = useState(0);
  const countUp = useCallback(() => countChg(prev => prev + 1), []);
  const countDown = useCallback(() => countChg(prev => prev - 1), []);

  return (
    <div>
      {flag && <p>{text}</p>}
      <button onClick={action}>ボタン</button>
      <p>count:{count}</p>
      <button onClick={countUp}>+</button>
      <button onClick={countDown}>-</button>
    </div>
  );
};

export default Example;
EOT \
&& cat << 'EOT' > src/components/Example/index.stories.tsx
import React from "react";

import { storiesOf } from "@storybook/react";
import { withInfo } from "@storybook/addon-info";
import { withKnobs, text, boolean } from "@storybook/addon-knobs";
import { action } from "@storybook/addon-actions";

import Example from "../Example";

const components = storiesOf("Components", module);
components
  .addDecorator(withKnobs)
  .addDecorator(withInfo({ inline: true }))
  .add("Example", () => (
    <Example
      text={text("テキスト", "ああああ")}
      flag={boolean("テキスト表示", true)}
      action={action("ぽちっとな")}
    />
  ));
EOT \
&& atom . && npm start
```

[Adding TypeScript](https://create-react-app.dev/docs/adding-typescript/)
[Storybook V5+React+TypeScriptで環境構築](https://qiita.com/otanu/items/dd06d6702f673268c74e)
[The 100% correct way to structure a React app (or why there’s no such thing)](https://medium.com/hackernoon/the-100-correct-way-to-structure-a-react-app-or-why-theres-no-such-thing-3ede534ef1ed)
