import "bootstrap";
import { anime11 } from '../components/animejs';
import { anime1 } from '../components/animejs';
import { barjs } from '../components/bars';

if (document.querySelector(".ml11 .letters")){
anime1();
anime11();
}

if (document.querySelector(".ldBar")){
barjs();
}


