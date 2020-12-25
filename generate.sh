#! /bin/bash

read -p "Component name " name

generateComponent() {
# Create folder and files
mkdir "$name"
touch "${name}/index.js"
touch "${name}/${name}.js"
touch "${name}/${name}Container.js"
touch "${name}/${name}.scss"

# index.js content
echo "export { default } from './${name}Container';" >> "${name}/index.js"

# ${name}.js content
echo "import React from 'react';
import './${name}.scss';

const ${name} = () => {};

export default ${name};" >> "${name}/${name}.js"

# ${name}Container.js content
echo "import { connect } from 'react-redux';
import ${name} from './${name}';

function mapStateToProps(state) {};

function mapDispatchToProps(dispatch) {};

export default connect(mapStateToProps, mapDispatchToProps)(${name});" >> "${name}/${name}Container.js"

}

generateComponent name
