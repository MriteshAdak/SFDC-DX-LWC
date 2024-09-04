const { jestConfig } = require('@salesforce/sfdx-lwc-jest/config');

module.exports = {
    ...jestConfig,
    moduleNameMapper: {
        '^lightning/button$': '<rootDir>/force-app/test/jest-mocks/lightning/button'
    },
    modulePathIgnorePatterns: ['<rootDir>/.localdevserver']
};