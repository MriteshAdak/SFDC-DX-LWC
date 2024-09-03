import { LightningElement, track, wire } from 'lwc';
import getControllingAndDependentPicklistValues from '@salesforce/apex/DependentPicklistController.getControllingAndDependentPicklistValues';

export default class DependentPicklistComponent extends LightningElement {
    @track controllingOptions = [];
    @track dependentOptions = [];
    allPicklistValues = {};

    selectedControllingValue = '';

    @wire(getControllingAndDependentPicklistValues)
    wiredPicklistValues({ error, data }) {
        if (data) {
            this.allPicklistValues = data;
            // Extract controlling field options
            this.controllingOptions = Object.keys(data).map((key) => ({
                label: key,
                value: key,
            }));
        } else if (error) {
            // Handle error
            console.error('Error fetching picklist values:', error);
        }
    }

    handleControllingChange(event) {
        this.selectedControllingValue = event.detail.value;

        // Set dependent options based on selected controlling value
        const dependentValues = this.allPicklistValues[this.selectedControllingValue] || [];
        this.dependentOptions = dependentValues.map((value) => ({
            label: value,
            value: value,
        }));
    }
}
