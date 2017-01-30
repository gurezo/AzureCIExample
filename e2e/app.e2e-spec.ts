import { AzureCIExamplePage } from './app.po';

describe('azure-ciexample App', function() {
  let page: AzureCIExamplePage;

  beforeEach(() => {
    page = new AzureCIExamplePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
