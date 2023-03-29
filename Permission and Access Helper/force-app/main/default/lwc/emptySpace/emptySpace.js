import { LightningElement,api,track } from 'lwc';
import desertResource from './Desert.html';
import noAccesResource from './noAccess.html';
export default class EmptySpace extends LightningElement {

 
    render(){
        // switch(svgs){
        //     case"desertResource":
        //     return desertResource;
        //     break;
        //     case"noAccesResource": 
        //     return noAccesResource;
        //     break;
            return noAccesResource;
        //}
    }

}