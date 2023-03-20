import { LightningElement,api,track } from 'lwc';
import desertResource from './Desert.html';
import noAccesResource from './noAccess.html';
export default class EmptySpace extends LightningElement {

 
   

    // render() {
    //    if(temp === desertResource){
    //     return desertResource;
    //    }
    //    else{
    //     return noAccesResource;
    //    }
    // }
    render(){
        return desertResource;
    }
    // switchTemplate(){ 
       
    // }

}