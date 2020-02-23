## Display click actions using `@storybook/addon-actions`

```sh
$ yarn add -D @storybook/addon-actions
```

```ts
// .storybook/addons.ts

import '@storybook/addon-actions/register';
```

```ts
// src/components/Button/index.tsx

import MaterialButton from "@material-ui/core/Button";
import * as React from "react";

type Props = {
  title: string;
  onClick: (props?: React.MouseEvent<HTMLButtonElement, MouseEvent>) => void;
};

export const Button: React.FC<Props> = props => {
  return (
    <MaterialButton variant="contained" onClick={props.onClick}>
      {props.title}
    </MaterialButton>
  );
};

export default Button;
```

```ts
// src/components/Button/index.stoties.tsx

import * as React from "react";
import { storiesOf } from "@storybook/react";
import { Button } from "./index";
import { action } from "@storybook/addon-actions";

const props = {
  title: "Button",
  onClick: action("clicked")
};

storiesOf("Atoms", module).add("Button", () => <Button {...props} />);
```

[storybookjs/storybook/addons/actions - GitHub](https://github.com/storybookjs/storybook/tree/master/addons/actions)
[StoryBook（React）最初の1歩](https://qiita.com/sugasaki/items/66d260f9602921196b07)
