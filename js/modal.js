const modalController = ({modal, btnOpen, btnClose, time = 300}) => {
    const buttonElems = document.querySelectorAll(btnOpen);
    const modalElem = document.querySelector(modal);
  
    modalElem.style.cssText = `
      display: flex;
      visibility: hidden;
      opacity: 0;
      transition: opacity ${time}ms ease-in-out;
    `;
  
    const closeModal = event => {
      const target = event.target;
  
      if (
        target === modalElem ||
        (btnClose && target.closest(btnClose)) ||
        event.code === 'Escape'
        ) {
        
        modalElem.style.opacity = 0;
  
        setTimeout(() => {
          modalElem.style.visibility = 'hidden';
        }, time);
  
        window.removeEventListener('keydown', closeModal);
      }
    }
  
    const openModal = () => {
      modalElem.style.visibility = 'visible';
      modalElem.style.opacity = 1;
      window.addEventListener('keydown', closeModal)
    };
  
    buttonElems.forEach(btn => {
      btn.addEventListener('click', openModal);
    });
  
    modalElem.addEventListener('click', closeModal);
  };
  
  modalController({
    modal: '.modal1',
    btnOpen: '.komentariya_content',
    btnClose: '.modal__close',
  });

  modalController({
    modal: '.modal_inter1',
    btnOpen: '.info_content_img1',
    btnClose: '.modal__close_img',
  });

  modalController({
    modal: '.modal_inter2',
    btnOpen: '.info_content_img2',
    btnClose: '.modal__close_img',
  });

  modalController({
    modal: '.modal_food1',
    btnOpen: '.info_content_img_food1',
    btnClose: '.modal__close_img',
  });

  modalController({
    modal: '.modal_food2',
    btnOpen: '.info_content_img_food2',
    btnClose: '.modal__close_img',
  });

  modalController({
    modal: '.modal_food3',
    btnOpen: '.info_content_img_food3',
    btnClose: '.modal__close_img',
  });

  modalController({
    modal: '.modal_food4',
    btnOpen: '.info_content_img_food4',
    btnClose: '.modal__close_img',
  });


