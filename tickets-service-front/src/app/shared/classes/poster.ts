export class Poster{
  id:number;
  poster:string;
constructor(id:number,poster:string){
	this.id=id;
	this.poster=poster;
	}
  get getImage(): string {
    return this.poster;
  }
}

